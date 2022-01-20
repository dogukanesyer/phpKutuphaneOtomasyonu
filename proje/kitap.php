<?php
if(isset($_POST['ekle'])){
	$kitapAd=isset($_POST['kitapAd']) ? $_POST["kitapAd"] : '';
	$Isbn=isset($_POST['Isbn']) ? $_POST["Isbn"] : '';
	$yayinTarihi=isset($_POST['yayinTarihi']) ? $_POST["yayinTarihi"] : '';
	$sayfaSayisi=isset($_POST['sayfaSayisi']) ? $_POST["sayfaSayisi"] : '';
	$kategori_id=isset($_POST['kategori_id']) ? $_POST["kategori_id"] : '';
	$kategori=isset($_POST['kategori']) ? $_POST["kategori"] : '';
	$yayinevi_id=isset($_POST['yayinevi_id']) ? $_POST["yayinevi_id"] : '';
	$yayinEviAd=isset($_POST['yayinEviAd']) ? $_POST["yayinEviAd"] : '';
	$yazar_id=isset($_POST['yayinevi_id']) ? $_POST["yayinevi_id"] : '';
	$yazar=isset($_POST['yazar']) ? $_POST["yazar"] : '';
	$baglan = mysqli_connect("localhost","root","","kutuphane");
	$sql="INSERT INTO kitaplar(Isbn, kitapAd,  yayinTarihi, sayfaSayisi, kategori_id, kategori, yayinevi_id, yayinEviAd, yazar_id, yazar) VALUES
	('$Isbn', '$kitapAd',  '$yayinTarihi', '$sayfaSayisi', '$kategori_id', '$kategori', '$yayinevi_id', '$yayinEviAd', '$yazar_id', '$yazar')";
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
<li><a>Kitap İşlemleri</a></li>
<li><a href="uye.php">Üye İşlemleri</a></li>
</ul></div>

<div class="section">
<div class="table">
<table border=0 width="45%">
<form action="" method="POST">
<tr>
<th colspan="3">Kitap Adı:</th><td><input type="text" name="kitapAd" placeholder="Kitap adını yazınız.."></td>
</tr>
<tr>
<th colspan="3">ISBN Numarası:</th><td><input type="text" name="Isbn" placeholder="Isbn numarasını yazınız.."></td>
</tr>
<tr>
<th colspan="3">Yayın Tarihini Girin:</th><td><input type="date" name="yayinTarihi" placeholder="Yayın tarihini girin.."></td>
</tr>
<tr>
<th colspan="3">Sayfa Sayısı:</th><td><input type="text" name="sayfaSayisi" placeholder="Sayfa sayısını yazınız.."></td>
</tr>
<tr>
<th colspan="3">Kategori Id Girin:</th><td><input type="text" name="kategori_id" placeholder="Kategori Id Girin.."></td>
</tr>
<tr>
<th colspan="3">Kategori:</th><td><input type="text" name="kategori" placeholder="Kategori yazınız.."></td>
</tr>
<tr>
<th colspan="3">Yayınevi Id:</th><td><input type="text" name="yayinevi_id" placeholder="Yayınevi Id Girin.."></td>
</tr>
<tr>
<th colspan="3">Yayınevi Adı:</th><td><input type="text" name="yayinEviAd" placeholder="Yayınevi adını yazınız.."></td>
</tr>
<tr>
<th colspan="3">Yazar Id:</th><td><input type="text" name="yazar_id" placeholder="Yazar Id Girin.."></td>
</tr>
<tr>
<th colspan="3">Yazar:</th><td><input type="text" name="yazar" placeholder="Yazarı yazınız.."></td>
</tr>
<tr>
<td colspan="2"><button type="submit" name="ekle">Ekle</button></td>
<td><input type="reset" name="Temizle" value="Temizle"></td>
<td><a href="kitaplistele.php" id="kitaplistele">Kayıtları Görüntüle</a></td>
</tr>
</form>
</table>
</div>
</div>

</body>
</html>