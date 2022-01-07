<?php
    /** @phpstan-ignore-line */
    @session_start();
      
    function changeSafe($state)
    {
        $_SESSION['SafeBox'] = $state;
    }

    if ($_SERVER['REQUEST_METHOD'] == 'POST') 
    {
        if($_POST['password'] == '1234')
        {
            header('Content-Type: application/json');
            echo json_encode(array('access' => true));
            changeSafe(true);
        }
        else if($_POST['password'] != '1234')
        {
            header('Content-Type: application/json');
            echo json_encode(array('access' => false));
            changeSafe(false);
        }
    }

    function SafeBox()
    {
        if(!isset($_SESSION['SafeBox']))
        {
            return false;
        }
        return $_SESSION['SafeBox'];
    }
?>