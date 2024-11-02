<?php
class IncludeFilePresenter
{
    public function __construct()
    {
    }

    public function show($view, $data = []){
        include_once('view/'. $view . "View.php");
    }
}