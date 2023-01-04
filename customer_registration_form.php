
<!DOCTYPE html>
<html lang="eng">

<head>
    <meta charset="UTF-8">
    <title>Main Registration Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styling.css" type="text/css">
</head>

<body>
    <div class="background">
        <div class="navigation">
        </div>
        <div class="box">
            <h1 class="Title">Registration</h1>
            <form action="data_entry.php" method="POST">
                <div class="input_info">
                    <div style="height:20px; width:231.344px" class="input_box">
                        <label id="FN" for="firstName">First Name: &nbsp; </label>
                        <input type="text" id="firstName" name="firstName" autofocus placeholder="First Name" required>
                    </div>
                    <div class="input_box">
                        <label for="lastName">Last Name: &nbsp;</label>
                        <input type="text" id="lastName" name="lastName" required placeholder="Last Name">
                    </div>
                    <div class="input_box">
                        <label for="UserName">Username: &nbsp;&nbsp;</label>
                        <input type="text" id="UserName" name="UserName" required placeholder="Username">
                    </div>

                    <div class="input_box">
                        <label for="email">Email Address: &nbsp;</label>
                        <input style="margin-left: 5px ;" type="text" id="email" name="email" required placeholder="Email address">
                    </div>

                    <div class="input_box">
                        <label id="Pa" for="Pass">Password: &nbsp;</label>
                        <input type="password" id="Pass" name="Pass" required placeholder="Password">
                    </div>
                    <div class="input_box">
                        <label for="number">Phone Number: &nbsp;</label>
                        <input type="tel" name="number" id="number" required placeholder="(0909176554)">
                    </div>
                    <div style="padding-top: 15px ; padding-left: 99px ; ">
                        <input type="password" id = "pass_confirmation" name="pass_confirmation" placeholder="Re-enter password" style="border-radius: 1px;" >
                    </div>
                    <div style="width: 143.22px; padding-top:20px; padding-right:85px">
                        <label style="padding-right: 2px ; font-size: 12px;" for="Country_Code">Country Code: &nbsp;</label>
                            <select name="Country_Code" id="Country_Code">
                                <option value="(+81) ">+81</option>
                                <option value="(+84) ">+84</option>
                                <option value="(+44) ">+44</option>
                                <option value="(+1) ">+1</option>
                            </select>
                    </div>
                </div>
                <div style="padding-top: 20px ; padding-left: 350px;">
                    <label style="font-size:12px; text-shadow: 2px 2px 2px black; margin-right: 3px;" for="country">Country: &nbsp;</label>
                        <select  name="country" id="country" required>
                            <option value="USA">USA</option>
                            <option value="Japan">Japan</option>
                            <option value="UK">UK</option>
                            <option value="VN" selected>Vietnam</option>
                        </select>
                </div>
                <div class="gender-option">
                    <table style="padding-top: 20px; padding-left: 350px">
                        <tr>
                            <td style="font-size:12px ; text-shadow: 2px 2px 2px black; padding-right: 12px;" rowspan="3">Gender</td>

                            <td style="font-size:12px ; text-shadow: 2px 2px 2px black; padding-bottom: 10px;">
                                <input class="gender_box" type="radio" name="Gender" id="male" value="Male">
                                <label for="male">Male</label>
                            </td>
                        </tr>
                        <tr>
                                <td style="font-size:12px ; text-shadow: 2px 2px 2px black; padding-bottom: 10px;">
                                <input class="gender_box" type="radio" name="Gender" id="female" value="Female">
                                <label for="female">Female</label></td>
                        </tr>
                                <td style="font-size:12px ; text-shadow: 2px 2px 2px black">
                                <input class="gender_box" type="radio" name="Gender" id="others" value="Others">
                                <label for="others">Others</label></td>
                        </tr>
                            
                        
                    </table>
                
                </div>
                <div>
                    <input class="sign-in" type="submit" value="submit">
                    
                </div>
            </form>