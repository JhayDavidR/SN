using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using tareas.Models;

namespace tareas.Controllers
{
    public class CoordinadorController : Controller
    {
        private readonly ILogger<CoordinadorController> _logger;

        public CoordinadorController(ILogger<CoordinadorController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Ausencias()
        {
            return View();
        }


        public IActionResult GestionAlumnos()
        {
            return View();
        }

        public IActionResult Presupuesto()
        {
            return View();
        }

        
     
        

        

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
