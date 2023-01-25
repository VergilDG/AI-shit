

RegisterNUICallback('accountInformation', function()
    TriggerServerEvent("account:information:sv", exports['serenity_manager']:isPed('cid'))
  end)

RegisterNetEvent("account:information:cl")
AddEventHandler("account:information:cl", function(licences, paycheck, phone)
  local responseObject = {
    cid = exports["serenity_manager"]:isPed("cid"),
    paycheck = paycheck,
    cash = exports["serenity_manager"]:isPed("mycash"),
    bank = exports["serenity_manager"]:isPed("mybank"),
    myNumber = phone,
    job = exports["serenity_manager"]:isPed("myjob"),
    secondaryJob = exports["serenity_manager"]:isPed("secondaryjob"),
    licenses = licences, 
    pagerStatus = exports["serenity_manager"]:isPed("pagerstatus"),
    chips = RPC.execute("serenity-phone:getChips")
  }
  SendNUIMessage({openSection = "accountInformation", response = responseObject})
end)

  