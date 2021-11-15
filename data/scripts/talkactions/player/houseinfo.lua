local houseinfo = TalkAction("!houseinfo")
function houseinfo.onSay(cid, words, param, channel)
    if getHouseByPlayerGUID(getPlayerGUID(cid)) == nil then
        doPlayerSendCancel(cid, 'You do not own a house.')
    return true
    end
    
    local house = getHouseByPlayerGUID(getPlayerGUID(cid))

    str1 = 'Hi, '.. getCreatureName(cid) ..'. You own the house named "'.. getHouseName(house) ..'"'
    str2 = 'Location: '.. getTownName(getHouseInfo(house).town) 
    str3 = 'Rent value: '.. getHouseRent(house) 
    str4 = 'Next Payment: '.. os.date("%d %B %Y %X ", getHouseInfo(house).paidUntil)
    doPlayerSendTextMessage(cid, 20, str1 ..'\n'.. str2 ..'\n'.. str3 ..'\n'.. str4)
    
return true
end
houseinfo:register()