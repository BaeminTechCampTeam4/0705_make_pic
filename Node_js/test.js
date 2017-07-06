var fs = require('fs')

var result = "<div style='width: 256px;'>"
fs.readFile('../4.tech', function(err, data) {
	if(err) throw err

	var buff = new Buffer(data, 'utf8')
	var string = buff.toString('hex')

	var color = ""
	var cal1 = '<div style="width: 1px; height: 1px; float: left; background-color:#'
	var cal2 = '"></div>'
	for(var i = 0; i < string.length; i++) {
		var str = cal1
		color += string[i]
		if((i+1) % 8 === 0) {
			color = color.slice(0, 6)
			str += color + cal2
			result += str
			var color = ""
		}
		str = cal1
	}
	result += "</div>"
	fs.writeFile("result.html", result, function(err) {
		if(err) throw err
	})
})
