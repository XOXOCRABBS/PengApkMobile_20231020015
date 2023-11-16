<?php
    header('Content-Type: application/json');
    include('db.php');
    if(!isset($_POST['id']) && !isset($_POST['nama']) && !isset($_POST['address']) && !isset($_POST['$salary'])) {
        echo json_encode("No Data Sent");
    }
    else{
        $id = $_POST['id'];
        $title = $_POST['nama'];
        $content = $_POST['address'];
        $salary = $_POST['salary'];
        $result = mysqli_query($db,"UPDATE employees SET nama = '{$title}',  address = '{$content}', salary = '{$salary}' WHERE id ={$id}");
        if($result)
        {
            echo json_encode("Success");
        }
        else{
            echo json_encode("Failed");
        }
    }
?>