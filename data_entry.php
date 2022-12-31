<?php
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName'];
    $Username = $_POST['UserName'];
    $Password = $_POST['Pass'];
    $pass_conf = $_POST['pass_confirmation'];
    $email = $_POST['email'];
    $country = $_POST['country'];
    $country_code = $_POST['Country_Code'];
    $Mobile = $_POST['Country_Code'].$_POST['number'];
    $Gender = $_POST['Gender'];
    $connection = new mysqli('127.0.0.1','root','','24h_international_delivery');
    if ($connection->connect_error){
        die('Connection Failed : '.$connection->connect_error);}
    else {
        if ($Password !== $pass_conf){
            die('Password Mismatch');}
        
        $stmt = $connection->prepare("insert into Customer_info (first_name,last_name,username,user_password,email,country,gender,Mobile_number) values(?,?,?,?,?,?,?,?)");
        $stmt->bind_param("ssssssss",$firstName,$lastName,$Username,$Password,$email,$country,$Gender,$Mobile);
        $stmt->execute();
        echo "registration completed";
        $stmt->close();
        $connection->close();
    } 


?>
