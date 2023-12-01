<?php

namespace App\Http\Controllers\Api;

use App\Models\Client;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

class ClientController extends Controller
{
    public function  index()
    {
      $clients = Client::all();

      if($clients -> count() > 0) {

        return response() ->json([
          'status' => 200,
          'clients' => $clients
        ], 200);

      }else{
         
        return response() ->json([
            'status' => 404,
            'message' => 'No Data Found'
            ], 404);
      }

    }

    public function store(Request $request)
    {
        $validator = Validator::make(
            $request->all(), [
               'uuid' => 'required',
               'id_number' => 'required',
               'dateOfBirth' => 'required',
               'firstName' => 'required',
               'lastName' => 'required',
               'emailAddress' => 'required',
               'telephone' => 'required|digits:10',
               'status' => 'required'
            ]);


         if($validator->fails())
         {
             return response()->json([
              'status' => 422,
              'errors' => $validator->messages()
             ],422);

         }else{
            
            $client = Client::create([
                'uuid' =>  $request->uuid,
                'id_number' => $request->id_number,
                'dateOfBirth' => Carbon::parse($request->dateOfBirth)->format('y/m/d'),
                'firstName' => $request->firstName,
                'lastName' => $request->lastName,
                'emailAddress' => $request->emailAddress,
                'telephone' =>$request->telephone,
                'status' => $request-> status
            ]);

            if($client) {
              
                return response()->json([
                    'status' => 200,
                    'message' => "Client Created Successfully"
                ], 200);
               
            }else {

                return response()->json([
                    'status' => 500,
                    'message' => "Failed to create client"
                ], 500);

            }
         }
    }


    public function edit($id)
    { 
        $client = Client::find($id);
        if($client){

            return response()->json([
                'status' => 200,
                'client' => $client
            ], 200);

        }else{
            return response()->json([
                'status' => 404,
                'message' => "client not found!"
            ], 404);
        }

    }

    public function update(Request $request, int $id)
    {
        $validator = Validator::make(
            $request->all(), [
                'uuid' => 'required',
                'id_number' => 'required',
                'dateOfBirth' => 'required',
                'firstName' => 'required',
                'lastName' => 'required',
                'emailAddress' => 'required',
                'telephone' => 'required|digits:10',
                'status' => 'required'
            ]);


            if($validator->fails())
            {
                return response()->json([
                 'status' => 422,
                 'errors' => $validator->messages()
                ],422);
   
            }else{

                $client = Client::find($id);

               if($client) {

                $client->update([
                    'uuid' =>  $request->uuid,
                    'id_number' => $request->id_number,
                    'dateOfBirth' => Carbon::parse($request->dateOfBirth)->format('y/m/d'),
                    'firstName' => $request->firstName,
                    'lastName' => $request->lastName,
                    'emailAddress' => $request->emailAddress,
                    'telephone' =>$request->telephone,
                    'status' => $request-> status
                ]);
                 
                   return response()->json([
                       'status' => 200,
                       'message' => "Client updated Successfully"
                   ], 200);
                  
               }else {
   
                   return response()->json([
                       'status' => 404,
                       'message' => "No client Found!"
                   ], 404);
   
               }
         }
    }

    public function delete(int $id)
    {
       $client = Client::find($id);

       if($client){
         $client->delete();
         return response()->json([
            'status' => 200,
            'message' => "Client deleted successfully"
         ], 200);

       }else{
        return response()->json([
            'status' => 404,
            'message' => "No client Found!"
        ], 404);
       }

    }



}
