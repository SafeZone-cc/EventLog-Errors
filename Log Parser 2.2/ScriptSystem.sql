/*  Find top 1000 warnings and errors in the SYSTEM Log 
    Levels: 1=Error, 2=Warning                                 */

SELECT TOP 1000 
TimeGenerated, 
BIT_AND(EventID, 0x3fffffff) as EventID,
EventTypeName as Name,
SourceName as Source,
Strings, Message, Data 
INTO '..\Logs\EventLog_SYSTEM.html'
FROM SYSTEM
WHERE EventType = 1 OR EventType = 2
ORDER BY TimeGenerated DESC