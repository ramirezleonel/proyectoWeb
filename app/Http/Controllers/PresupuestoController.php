<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View;

class PresupuestoController extends Controller
{
  public function index(){

    return View('presupuesto');

  }
}
