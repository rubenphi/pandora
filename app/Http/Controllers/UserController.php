<?php

namespace App\Http\Controllers;


use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\CreateUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Http\Traits\Traits;
use Illuminate\Support\Arr;

class UserController extends Controller
{
  /**
  * Display a listing of the resource.
  *
  * @return \Illuminate\Http\Response
  */
  public function index() {
    if (Traits::superadmin()) {

      $users = User::all();
      return $users;

    } else {
      return response()->json([
        'res' => false,
        'message' => 'Acceso denegado, no es administrador del sistema'
      ], 200);
    }


  }

  public function logeduser() {
    return Traits::loged();

  }

  /**
  * Store a newly created resource in storage.
  *
  * @param \Illuminate\Http\Request $request
  * @return \Illuminate\Http\Response
  */
  public function store(CreateUserRequest $request) {
    Arr::set($request, 'rol', 'estudiante');

    $input = $request->all();
    $input['password'] = Hash::make($request->password);

    User::create($input);
    return response()->json([
      'res' => true,
      'message' => 'registro exitoso'
    ], 200);
  }

  public function login(LoginRequest $request) {
    $user = User::whereName($request->name)->first();
    if (!is_null($user) && Hash::check($request->password, $user->password)) {
      $user->tokens->each(function ($tok, $key) {
        $tok->revoke();
      });
      $token = $user->createToken('pandora')->accessToken;
      return response()->json([
        'res' => true,
        'token' => $token,
        'message' => "success login"
      ],
        200);
    } else {
      return response()->json([
        'res' => false,
        'message' => "login fail"
      ], 200);
    }
  }

  public function logout(\Illuminate\Http\Request $request) {
    $user = auth()->user();
    $user->token()->revoke();
    return response()->json([
      'res' => true,
      'message' => 'Logout success'
    ], 200);
  }

  public function logoutAll() {

    $user = auth()->user();
    $user->tokens->each(function ($token, $key) {
      $token->revoke();
    });
    $user->save();

    return response()->json([
      'res' => true,
      'message' => 'Logout success on all services'
    ], 200);
  }

  /**
  * Display the specified resource.
  *
  * @param int $id
  * @return \Illuminate\Http\Response
  */
  public function show(User $user) {

    if (Traits::mismo($user->id) || Traits::superadmin()) {
      return $user;
    } else {
      return response()->json([
        'res' => false,
        'message' => 'access denied'
      ], 200);
    }
  }

  /**
  * Update the specified resource in storage.
  *
  * @param \Illuminate\Http\Request $request
  * @param int $id
  * @return \Illuminate\Http\Response
  */
  public function update(Request $request, User $user) {
    if (!Traits::superadmin()) {
      Arr::set($request, 'rol', $user->rol);
    }

    if (Traits::mismo($user->id) || Traits::superadmin()) {

      $request["password"] = Hash::make($request->password);
      $user->update($request->all());
      return response()->json([
        'res' => true,
        'message' => 'success operation'
      ], 200);
    } else {
      return Traits::error('A menos que sea administrador, solo puede cambiar sus propios datos', 400);
    }
  }

  /**
  * Remove the specified resource from storage.
  *
  * @param int $id
  * @return \Illuminate\Http\Response
  */
  public function destroy($id) {
    if (Traits::superadmin()) {
      User::destroy($id);
      return response()->json([
        'res' => true,
        'message' => 'success operation'
      ], 200);
    } else {
      return response()->json([
        'res' => false,
        'message' => 'access denied'
      ], 200);
    }
  }


}