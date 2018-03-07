--Bootcamp and Virtual machines consume a license
--If they aren't being used we remove them from inventory 
SELECT NAME, MAC, LAST_INVENTORY, OS_NAME, CS_MANUFACTURER, CS_MODEL, BIOS_DESCRIPTION, BIOS_MANUFACTURER
FROM ORG1.MACHINE
where not
    (CS_MANUFACTURER like "Dell%"
    or CS_MANUFACTURER like "TOSH%"
    or CS_MANUFACTURER like "Microsoft%"
    or CS_MANUFACTURER like "Acer%"
    or CS_MANUFACTURER like "PowerSpec"
    or CS_MANUFACTURER like "Hewlett%")
and OS_NAME like "Mic%"
and LAST_INVENTORY < DATE_SUB(NOW(), INTERVAL 3 MONTH)
ORDER BY NAME
