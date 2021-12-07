<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Question;
use Illuminate\Support\Facades\DB;

class QuizDataController extends Controller
{
    //
    function fetch($category){
        $data = DB::table('questions')->where('category', $category)->get();
         return $data;
    }

    function store(Request $req){
        $data = new Question;
        $data->question = $req->question;
        $data->optionA = $req->optionA;
        $data->optionB = $req->optionB;
        $data->optionC = $req->optionC;
        $data->optionD = $req->optionD;
        $data->correctOption = $req->correctOption;
        $data->category = $req->category;

        $result = $data->save();
        if($result){
            return "data stored";
        }
        else{
            return "operation failed";
        }
    }
    function delete($id){
        $data = Question::find($id);

        $res = $data->delete();
        if($res){
            return "Data Deleted";
        }
        else{
            return "Operation Failed";
        }

    }

    function fetchOne($id){
        $data = DB::table('questions')->where('id', $id)->get();
         return $data;
    }

    function update(Request $req){
        $data = Question::find($req->id);
        $data->question = $req->question;
        $data->optionA = $req->optionA;
        $data->optionB = $req->optionB;
        $data->optionC = $req->optionC;
        $data->optionD = $req->optionD;
        $data->correctOption = $req->correctOption;
        $data->category = $req->category;

        $res = $data->update();
        if($res){
            return "Data Updated";
        }
        else{
            return "Operation Failed";
        }
    }

}
