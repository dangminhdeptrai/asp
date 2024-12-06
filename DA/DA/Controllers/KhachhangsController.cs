using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using DA.Data;
using DA.Models;
using Microsoft.AspNetCore.Identity;
using Newtonsoft.Json;
using DA.Data;
using DA.Models;

namespace DA.Controllers
{
    public class KhachhangsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IPasswordHasher<Khachhang> _passwordHasher;
        public KhachhangsController(ApplicationDbContext context, IPasswordHasher<Khachhang> passwordHasher)
        {
            _context = context;
            _passwordHasher = passwordHasher;
        }

        // GET: Khachhangs
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Mathangs.Include(m => m.MaNhNavigation);
            GetData();
            return View(await applicationDbContext.ToListAsync());
        }
        public async Task<IActionResult> AddToCart(int id)
        {
            var mathang = await _context.Mathangs.FirstOrDefaultAsync(m => m.MaMh == id);
            if (mathang == null)
            {
                return NotFound("Sản phẩm không tồn tại");
            }
            var cart = GetCartItems();
            var item = cart.Find(p => p.MatHang.MaMh == id);
            if (item != null)
            {
                item.SoLuong++;
            }
            else
            {
                cart.Add(new CartItem() { MatHang = mathang, SoLuong = 1 });
            }
            SaveCartSession(cart);
            return RedirectToAction(nameof(ViewCart));
        }
        public IActionResult ViewCart()
        {
            GetData();
            return View(GetCartItems());
        }
        private bool MathangExists(int id)
        {
            return _context.Mathangs.Any(e => e.MaMh == id);
        }
        List<CartItem> GetCartItems()
        {
            var session = HttpContext.Session;
            string? jsoncart = session.GetString("shopcart");
            if (jsoncart != null)
            {
                var cartItems = JsonConvert.DeserializeObject<List<CartItem>>(jsoncart);
                return cartItems ?? new List<CartItem>();
            }
            return new List<CartItem>();
        }
        void SaveCartSession(List<CartItem> list)
        {
            var session = HttpContext.Session;
            string jsoncart = JsonConvert.SerializeObject(list);
            session.SetString("shopcart", jsoncart);
        }

        void ClearCart()
        {
            var session = HttpContext.Session;
            session.Remove("shopcart");
        }
        // Xóa một mặt hàng khỏi giỏ
        public IActionResult RemoveItem(int id)
        {
            var cart = GetCartItems();
            var item = cart.Find(p => p.MatHang.MaMh == id);
            if (item != null)
            {
                cart.Remove(item);
            }
            SaveCartSession(cart);
            return RedirectToAction(nameof(ViewCart));
        }
        // Cập nhật số lượng một mặt hàng trong giỏ
        public IActionResult UpdateItem(int id, int quantity)
        {
            var cart = GetCartItems();
            var item = cart.Find(p => p.MatHang.MaMh == id);
            if (item != null)
            {
                item.SoLuong = quantity;
            }
            SaveCartSession(cart);
            return RedirectToAction(nameof(ViewCart));
        }

        public IActionResult CheckOut()
        {
            GetData();
            return View(GetCartItems());
        }

        // Lập hóa đơn: lưu hóa đơn, lưu chi tiết hóa đơn
        [HttpPost, ActionName("CreateBill")]
        public async Task<IActionResult> CreateBill(string email, string hoten, string dienthoai, string diachi)
        {
            // Xử lý thông tin khách hàng (trường hợp khách mới)
            var kh = new Khachhang();
            kh.Email = email;
            kh.Ten = hoten;
            kh.DienThoai = dienthoai;
            _context.Add(kh);
            await _context.SaveChangesAsync();
            var hd = new Hoadon();
            hd.Ngay = DateTime.Now;
            hd.MaKh = kh.MaKh;
            _context.Add(hd);
            await _context.SaveChangesAsync();

            // thêm chi tiết hóa đơn
            var cart = GetCartItems();
            int thanhtien = 0;
            int tongtien = 0;
            foreach (var i in cart)
            {
                var ct = new Cthoadon();
                ct.MaHd = hd.MaHd;
                ct.MaMh = i.MatHang.MaMh;
                thanhtien = i.MatHang.GiaBan * i.SoLuong ?? 1;
                tongtien += thanhtien;
                ct.DonGia = i.MatHang.GiaBan;
                ct.SoLuong = (short)i.SoLuong;
                ct.ThanhTien = thanhtien;
                _context.Add(ct);
            }
            await _context.SaveChangesAsync();

            // cập nhật tổng tiền hóa đơn
            hd.TongTien = tongtien;
            _context.Update(hd);
            await _context.SaveChangesAsync();

            // xóa giỏ hàng
            ClearCart();
            GetData();
            return View(hd);
        }

        void GetData()
        {
            ViewData["slg"] = GetCartItems().Count;
            ViewBag.nhanhang = _context.Nhanhangs.ToList();

            if (HttpContext.Session.GetString("khachhang") != "")
            {
                ViewBag.khachhang = _context.Khachhangs.FirstOrDefault(k => k.Email == HttpContext.Session.GetString("khachhang"));
            }
        }

        public async Task<IActionResult> List(int id)
        {
            var applicationDBcontext = _context.Mathangs.Where(m => m.MaNh == id).Include(m => m.MaNhNavigation);
            GetData();
            ViewData["tennhanhang"] = _context.Nhanhangs.FirstOrDefault(d => d.MaNh == id).Ten;
            return View(await applicationDBcontext.ToListAsync());
        }
        public IActionResult Register()
        {
            GetData();
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Register(string hoten, string dienthoai, string email, string matkhau)
        {
            Khachhang kh = new Khachhang();
            kh.Ten = hoten;
            kh.DienThoai = dienthoai;
            kh.Email = email;
            kh.MatKhau = _passwordHasher.HashPassword(kh, matkhau); // mã hóa mk 
            if (ModelState.IsValid)
            {
                _context.Add(kh);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Login));
        }
        public IActionResult Login()
        {
            GetData();
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Login(string email, string matkhau)
        {
            var kh = await _context.Khachhangs.FirstOrDefaultAsync(m => m.Email == email);
            if (kh != null && _passwordHasher.VerifyHashedPassword(kh, kh.MatKhau, matkhau) == PasswordVerificationResult.Success)
            {
                // Đăng nhập thành công, thực hiện các hành động cần thiết
                // Ví dụ: Ghi thông tin người dùng vào Session
                HttpContext.Session.SetString("khachhang", kh.Email);
                return RedirectToAction(nameof(ThongTinKhachHang));

            }
            return RedirectToAction(nameof(Login));
        }
        public IActionResult ThongTinKhachHang()
        {
            GetData();
            return View();
        }
        public IActionResult Signout()
        {
            HttpContext.Session.SetString("khachhang", "");
            GetData();
            return RedirectToAction("Index");
        }
        // GET: Khachhangs/Details/5
    }
}
