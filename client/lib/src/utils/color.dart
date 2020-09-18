String getContrastYIQ(String hexcolor) {
	return isDarkFg(hexcolor) ? 'black' : 'white';
}

bool isDarkFg(String hexcolor) {
  var r = int.parse(hexcolor.substring(0,2), radix: 16);
	var g = int.parse(hexcolor.substring(2,2), radix: 16);
	var b = int.parse(hexcolor.substring(4,2), radix: 16);
	var yiq = ((r*299)+(g*587)+(b*114))/1000;
	return yiq >= 128;
}