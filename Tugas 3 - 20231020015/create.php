<?php
    header('Content-Type: application/json');
    include('db.php');
    if(!isset($_POST['nama']) && !isset($_POST['address']) && !isset($_POST['salary'])) {
        echo json_encode("No Data Sent");
    }
    else{
        $title = $_POST['nama'];
        $content = $_POST['address'];
        $salary = $_POST['salary'];
        $result = mysqli_query($db,"INSERT INTO employees (nama, address, salary) VALUES
        ('{$title}','{$content}', '{$salary}')");
        if($result)
        {
            echo json_encode("Success");
        }
        else{
            echo json_encode("Failed");
        }
    }
?>