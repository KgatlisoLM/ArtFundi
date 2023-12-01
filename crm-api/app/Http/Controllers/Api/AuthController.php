<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;


class AuthController extends Controller
{
    
    public function login(Request $request)
    {
        $validator = Validator::make(
            $request->all(), [
               'email' => 'required|email',
               'password' => 'required',
               'device_name' => 'required'
            ]);


     if($validator->fails())
     {
        return response()->json([
            'status' => 422,
            'errors' => $validator->messages()
           ],422);

     }else{
         
        $user = User::where('email', $request->email)->first();

        if(!$user || !Hash::check($request->password, $user->password))
        {
            return response() ->json([
                'status' => 400,
                'errors' => "The provided credentials are incorrect"
            ], 400);
        }


        return $user->createToken($request->device_name)->plainTextToken;
     }

    }


    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            'status' => 204,
            'message' => 'Logout Successfully'
    ], 204);
    }
}
