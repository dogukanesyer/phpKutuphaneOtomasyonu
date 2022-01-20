<html>
<head>
<meta charset="UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="sayfa">
<div class="ust">
<a id="baslik2">Kütüphane Kayıt Sistemi</a><br><br><br><br>
<ul id="menu">
<li><a href="index.php">Anasayfa</a></li>
<li><a href="kitap.php">Kitap İşlemleri</a></li>
<li><a href="uye.php">Üye İşlemleri</a></li>
</ul></div>

<div class="section">
<?php

	$baglanti = mysqli_connect("localhost","root","","kutuphane");
	if($baglanti->connect_error){
		die("Bağlantı kurulamadı!".$baglanti->connect_error);
	}
	$sql2 = "SELECT uye_id, uyeAd, uyeSoyad, Tc_no, cinsiyet, telefon, eposta, adres_id FROM uyeler";
	$sonuc2 = $baglanti->query($sql2);
	if($sonuc2->num_rows > 0){
		while($bag = $sonuc2->fetch_assoc()){
			echo "<tr><td><h5><font color=yellow>" . $bag["uye_id"] ."</td>&nbsp<td>" . $bag["uyeAd"]."</td>&nbsp<td>" . $bag["uyeSoyad"]."</td>&nbsp<td>" . $bag["Tc_no"]."</td>&nbsp<td>" . $bag["cinsiyet"]."</td>&nbsp<td>" .
			$bag["telefon"] . "</td>&nbsp<td>" . $bag["eposta"] . "</td>&nbsp<td>" . $bag["adres_id"] . "</font></h5></td></tr><br>";
		}
		echo "</table>";
	}else { echo "<font color=red><h5>Sonuç yok</h5></font>"; }
	$baglanti->close();

?>

<table>
<form>
<tr><td><font color="ocean"><h3>Silmek istediğiniz üyenin Id'sini giriniz:</h3></font></td>
<td><input type="text" name="uye_id"></td>
<td><button type="submit" name="sil">Sil</button></td></tr>
</form>
</table>
</div>
</div>
</body>
</html>