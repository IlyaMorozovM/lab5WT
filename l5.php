<html>

<head>
    <style> 

body{
background-color: #444;
color: #ddd;
}
.error{
  color: red;  
}
    </style>
</head>
<body>
<?php

if (!isset($_POST['fields'])) {
    $_POST['fields'] = 0;
}

if (!isset($_POST['rows'])) {
    $_POST['rows'] = 0;
}
if (!isset($_POST['tablename'])) {
    $_POST['tablename'] = 'table name';
}

define("LOCALHOST","127.0.0.1");
define("LOGIN","root");
define("PASSWORD","1234");
define("BASE","newbase");
$mysqli = new mysqli(LOCALHOST, LOGIN, PASSWORD, BASE);
if ($mysqli->connect_errno) {

    echo "Error: connection imposible: \n";
    exit;
}

noreply("SET CHARACTER SET 'UTF8'",$mysqli);
noreply("SET NAMES 'UTF8'",$mysqli);

$sql = "SELECT accounts.account_login, accounts.account_pass , storage.storage_name , accounts.files_count,accounts.registration_date FROM accounts INNER JOIN storage ON  accounts.storage_id= storage.storage_id";
$result = noreply($sql,$mysqli);

//noreply("INSERT INTO `accounts` (`storage_id`, `account_login`, `account_pass`, `registration_date`, `files_count`) VALUES ('1', 'vitiav2', 'pass2', CURRENT_TIMESTAMP, NULL)",$mysqli);

if ($result->num_rows === 0) {
    echo "no accounts found";
    exit;
}

echo '<table> <tr><th>storage</th><th>login</th><th>pass</th><th>files count</th><th>registration date</th></tr>';
while ($account = $result->fetch_assoc()) {
    echo "<tr>\n";
    echo '<td>'.$account['storage_name'].'</td>';
    echo '<td>'.$account['account_login'].'</td>';
    echo '<td>'.$account['account_pass'].'</td>';
    echo '<td>'.$account['files_count'].'</td>';
    echo '<td>'.$account['registration_date'].'</td>';
    echo "</tr>\n";
}
echo '</table>';






?><form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
fileds in row:  <input type="number" name="fields" value=<?php echo $_POST['fields'] ?>> <br>
rows:  <input type="number" name="rows" value=<?php echo $_POST['rows'] ?>> <br>
<input type="text" name="tablename" value="<?php echo $_POST['tablename'] ?>"> <br>      
        <?php for ($i=0; $i < $_POST['fields']; $i++) { 
           echo  'field '.$i.' :<input type="text" name="field'.$i.'"> <select name="type'.$i.'"><option value="txt">text</option><option value="number">num</option></select><br>';
        }?>
        <input type="submit" value="submit" />
    </form>

<?php

if(checkallfields()){

for ($j=0; $j <$_POST['rows'] ; $j++) { 
    # code...

    $sql="INSERT INTO `".$_POST['tablename']."` (";
    
    
    for ($i=0; $i < $_POST['fields']; $i++) { 
       $sql.= $_POST['field'.$i];
       if  (($i+1) < $_POST['fields']){$sql.=',';}
    }
    
    $sql.=") VALUES (";
    for ($i=0; $i < $_POST['fields']; $i++) { 
        $sql.= "'".(($_POST['type'.$i]=='txt')?(myRandomString()):((string)rand(0,100)))."'";
        if  (($i+1) < $_POST['fields']){$sql.=",";}
     }
    $sql.=")";


    echo($sql).' will be sent <br>';
     
    noreply($sql,$mysqli);
}

    }else{
    
       echo 'fill fields now!';
    }

function noreply($request,$mysqli){
    if (!$result = $mysqli->query($request)) {
        echo '<div class="error">';
        echo "Error: request failed: <br>";
       // echo "Request: " . $request . "<br>";
       // echo "Code: " . $mysqli->errno . "\n";
        echo "Error: " . $mysqli->error . "<br>";
        echo '</div>';
        exit;
    }
    return $result;

}

function checkallfields(){
   for ($i=0; $i <$_POST['fields'] ; $i++) { 
  if((!isset($_POST['field'.$i]))||( ''== $_POST['field'.$i])){return false;}
   }
    return true;

}
function myRandomString()
    {
       $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $randstring = '';
        for ($i = 0; $i < rand(1,5)*10; $i++) {
            $randstring .= $characters[rand(0, strlen($characters) - 1)];
        }
        return $randstring;
    }
  
    ?>
    </body>
    </html>