<?php
if(isset($_POST['ekle'])){
	$Tc_no=isset($_POST['Tc_no']) ? $_POST["Tc_no"] : '';
	$uyeAd=isset($_POST['uyeAd']) ? $_POST["uyeAd"] : '';
	$uyeSoyad=isset($_POST['uyeSoyad']) ? $_POST["uyeSoyad"] : '';
	$cinsiyet=isset($_POST['cinsiyet']) ? $_POST["cinsiyet"] : '';
	$telefon=isset($_POST['telefon']) ? $_POST["telefon"] : '';
	$eposta=isset($_POST['eposta']) ? $_POST["eposta"] : '';
	$adres_id=isset($_POST['adres_id']) ? $_POST["adres_id"] : '';
	$baglan = mysqli_connect("localhost", "root", "", "kutuphane");
	$sql="INSERT INTO uyeler(Tc_no, uyeAd, uyeSoyad,  cinsiyet, telefon, eposta, adres_id) values
	('$Tc_no', '$uyeAd', '$uyeSoyad',  '$cinsiyet', '$telefon', '$eposta', '$adres_id')";
	
	if($baglan->query($sql) ===TRUE){
		echo "Kayıt Başarıyla Eklendi";
	}else{
		echo "Hata: " . $sql . "<br>" . $baglan->error;
	}
}
?>
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
<li><a>Üye İşlemleri</a></li>
</ul></div>

<div class="section">
<div class="table">

<table border=0 width="45%">

<form action="" method="POST">
<tr>
<th colspan="3">Üye Adı:</th><td><input type="text" name="uyeAd" placeholder="Üye adını yazınız.."></td>
</tr>
<tr>
<th colspan="3">Üye Soyadı:</th><td><input type="text" name="uyeSoyad" placeholder="Üye soyadını yazınız.."></td>
</tr>
<tr>
<th colspan="3">TC No:</th><td><input type="text" name="Tc_no" placeholder="TC numarası girin.."></td>
</tr>
<tr>
<th colspan="3">Cinsiyet:</th><td>E<input type="radio" name="cinsiyet" value="erkek">K<input type="radio" name="cinsiyet" value="kadın"></td>
</tr>
<tr>
<th colspan="3">Telefon:</th><td><input type="text" name="telefon" placeholder="Telefon numarası girin.."></td>
</tr>
<tr>
<th colspan="3">E-Posta:</th><td><input type="text" name="eposta" placeholder="E-Posta yazınız.."></td>
</tr>
<tr>
<th colspan="3">Adres Id:</th><td><input type="text" name="adres_id" placeholder="Adres Id Girin.."></td>
</tr>
<tr>
<td colspan="2"><button type="submit" name="ekle">Ekle</button></td>
<td><input type="reset" name="Temizle" value="Temizle"></td>
<td><a href="uyelistele.php" id="kitaplistele">Kayıtları Görüntüle</a></td>
</tr>
</form>

</table>

</div>
</div>
</body>
</html>