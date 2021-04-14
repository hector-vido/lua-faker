-- en_US.lua

local en_US = {}

function en_US.ssn() -- ITIN
	local area = math.random(900, 999)
	local serial = math.random(0, 9999)
	local group = math.random(70, 99)
	while group == 89 or group == 93 do
		group = math.random(70, 99)
	end
	return string.format('%03d-%02d-%04d', area, group, serial)
end

local accents = {
	['à'] = 'a', ['á'] = 'a', ['â'] = 'a', ['ã'] = 'a', ['ä'] = 'a',
	['À'] = 'A', ['Á'] = 'A', ['Â'] = 'A', ['Ã'] = 'A', ['Ä'] = 'A',
	['ç'] = 'c', ['Ç'] = 'C',
	['è'] = 'e', ['é'] = 'e', ['ê'] = 'e', ['ë'] = 'e',
	['È'] = 'E', ['É'] = 'E', ['Ê'] = 'E', ['Ë'] = 'E',
	['ì'] = 'i', ['í'] = 'i', ['î'] = 'i', ['ï'] = 'i',
	['Ì'] = 'I', ['Í'] = 'I', ['Î'] = 'I', ['Ï'] = 'I',
	['ñ'] = 'n', ['Ñ'] = 'N',
	['ò'] = 'o', ['ó'] = 'o', ['ô'] = 'o', ['õ'] = 'o', ['ö'] = 'o',
	['Ò'] = 'O', ['Ó'] = 'O', ['Ô'] = 'O', ['Õ'] = 'O', ['Ö'] = 'O',
	['ù'] = 'u', ['ú'] = 'u', ['û'] = 'u', ['ü'] = 'u',
	['Ù'] = 'U', ['Ú'] = 'U', ['Û'] = 'U', ['Ü'] = 'U',
	['ý'] = 'y', ['ÿ'] = 'y',
	['Ý'] = 'Y', ['Ÿ'] = 'Y'
}
function en_US.normalize(str)
	return string.gsub(str, '[%z\1-\127\194-\244][\128-\191]*', accents)
end

return en_US
