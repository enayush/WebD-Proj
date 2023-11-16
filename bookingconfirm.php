<!DOCTYPE html>
<html>

<?php
include('session_customer.php');
if (!isset($_SESSION['login_customer'])) {
    session_destroy();
    header("location: customerlogin.php");
}
?>

<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="shortcut icon" type="image/png" href="assets/img/P.png.png">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/w3css/w3.css">
    <script type="text/javascript" src="assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="assets/css/bookingconfirm.css" />
</head>

<body>
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation" style="color: black">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="index.php">
                    LAPS CAR RENTAL </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->

            <?php
            if (isset($_SESSION['login_client'])) {
                ?>
                <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="index.php">Home</a>
                        </li>
                        <li>
                            <a href="#"><span class="glyphicon glyphicon-user"></span> Welcome
                                <?php echo $_SESSION['login_client']; ?>
                            </a>
                        </li>
                        <li>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button"
                                        aria-haspopup="true" aria-expanded="false"><span
                                            class="glyphicon glyphicon-user"></span> Control Panel <span
                                            class="caret"></span> </a>
                                    <ul class="dropdown-menu">
                                        <li> <a href="entercar.php">Add Car</a></li>
                                        <li> <a href="enterdriver.php"> Add Driver</a></li>
                                        <li> <a href="empview.php">View</a></li>

                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="logout.php"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
                        </li>
                    </ul>
                </div>

                <?php
            } else if (isset($_SESSION['login_customer'])) {
                ?>
                    <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="index.php">Home</a>
                            </li>
                            <li>
                                <a href="#"><span class="glyphicon glyphicon-user"></span> Welcome
                                <?php echo $_SESSION['login_customer']; ?>
                                </a>
                            </li>
                            <ul class="nav navbar-nav">
                                <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button"
                                        aria-haspopup="true" aria-expanded="false"> Garagge <span class="caret"></span> </a>
                                    <ul class="dropdown-menu">
                                        <li> <a href="prereturncar.php">Return Now</a></li>
                                        <li> <a href="mybookings.php"> My Bookings</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <li>
                                <a href="logout.php"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
                            </li>
                        </ul>
                    </div>

                <?php
            } else {
                ?>

                    <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="index.php">Home</a>
                            </li>
                            <li>
                                <a href="emplogin.php">Client</a>
                            </li>
                            <li>
                                <a href="customerlogin.php">Customer</a>
                            </li>
                        </ul>
                    </div>
            <?php }
            ?>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <?php


    $type = "ac";
    $charge_type = $_POST['radio1'];
    $driver_id = $_POST['driver_id_from_dropdown'];
    $customer_username = $_SESSION["login_customer"];
    $car_id = $conn->real_escape_string($_POST['hidden_carid']);
    $rent_start_date = date('Y-m-d', strtotime($_POST['rent_start_date']));
    $rent_end_date = date('Y-m-d', strtotime($_POST['rent_end_date']));
    $return_status = "NR"; // not returned
    $fare = "NA";


    function dateDiff($start, $end)
    {
        $start_ts = strtotime($start);
        $end_ts = strtotime($end);
        $diff = $end_ts - $start_ts;
        return round($diff / 86400);
    }

    $err_date = dateDiff("$rent_start_date", "$rent_end_date");

    $sql0 = "SELECT * FROM cars WHERE car_id = '$car_id'";
    $result0 = $conn->query($sql0);

    if (mysqli_num_rows($result0) > 0) {
        while ($row0 = mysqli_fetch_assoc($result0)) {

            if ($type == "ac" && $charge_type == "km") {
                $fare = $row0["price"];
            } else if ($type == "ac" && $charge_type == "days") {
                $fare = $row0["price_per_day"];
            } else {
                $fare = "NA";
            }
        }
    }
    if ($err_date >= 0) {
        $sql1 = "INSERT into reservation(customer_username,car_id,driver_id,rent_start_date,rent_end_date,fare,charge_type,return_status) 
    VALUES('" . $customer_username . "','" . $car_id . "','" . $driver_id . "','" . $rent_start_date . "','" . $rent_end_date . "','" . $fare . "','" . $charge_type . "','" . $return_status . "')";
        $result1 = $conn->query($sql1);

        $sql2 = "UPDATE cars SET car_availability = 'no' WHERE car_id = '$car_id'";
        $result2 = $conn->query($sql2);

        $sql3 = "UPDATE driver SET driver_availability = 'no' WHERE driver_id = '$driver_id'";
        $result3 = $conn->query($sql3);

        $sql4 = "SELECT * FROM  cars c, employee cl, driver d, reservation rc WHERE c.car_id = '$car_id' AND d.driver_id = '$driver_id' AND cl.emp_username = d.emp_username";
        $result4 = $conn->query($sql4);


        if (mysqli_num_rows($result4) > 0) {
            while ($row = mysqli_fetch_assoc($result4)) {
                $id = $row["id"];
                $car_name = $row["car_name"];
                $car_nameplate = $row["car_nameplate"];
                $driver_name = $row["driver_name"];

                $dl_number = $row["dl_number"];
                $driver_phone = $row["driver_phone"];
                $emp_name = $row["emp_name"];
                $emp_phone = $row["emp_phone"];
            }
        }

        if (!$result1 | !$result2 | !$result3) {
            die("Couldnt enter data: " . $conn->error);
        }

        ?>
        <!-- Navigation -->
        

        <h2 class="text-center"> Your car has been booked successfully !!</h2>



        <h3 class="text-center"> <strong>Your Order Number:</strong> <span style="color: blue;">
                <?php echo "$id"; ?>
            </span> </h3>



        <!-- Navigation -->


    <?php } ?>


</html>