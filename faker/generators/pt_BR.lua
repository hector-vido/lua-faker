-- pt_BR.lua

local pt_BR = {}

local cep = {0,0,0,0,0,0,0,0}
function pt_BR.cep()
	for i = 1,8 do
		cep[i] = math.random(1,9)
	end
	return string.format('%s%s%s%s%s-%s%s%s', cep[1], cep[2], cep[3], cep[4], cep[5], cep[6], cep[7], cep[8], cep[9])
end

function pt_BR.cpf()
	local n = {0,0,0,0,0,0,0,0,0}
	for i = 1, 9 do
		n[i] = math.random(1, 9)
	end
	
	local d1 = 0
	for i = 1, 9 do
		d1 = d1 + n[#n + 1 - i] * (i + 1) -- reverse index
	end
	d1 = 11 - (d1 % 11)
	if d1 >= 10 then d1 = 0	end
	
	local d2 = 0
	n[#n + 1] = d1
	for i = 1, 10 do
		d2 = d2 + n[#n + 1 - i] * (i + 1) -- reverse index
	end
	d2 = 11 - (d2 % 11)
	if d2 >= 10 then d2 = 0	end
	
	return string.format('%s%s%s.%s%s%s.%s%s%s-%s%s', n[1], n[2], n[3], n[4], n[5], n[6], n[7], n[8], n[9], d1, d2)
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
function pt_BR.normalize(str)
	return string.gsub(str, '[%z\1-\127\194-\244][\128-\191]*', accents)
end

return pt_BR
