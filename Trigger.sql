Create trigger TR_Agent_AfterUpdateInsert
on [dbo].[Agents]
after Insert,Update
as
if exists (select * from inserted) and exists (Select * from deleted) and Update(Приоритет)
begin 
insert into HistoryAgent (NameAgent,PrioritetOld,PrioritetNew)
select i.НаименованиеАгента,d.Приоритет,i.Приоритет
from inserted i inner join deleted d on i.id = d.id
end
if exists (select * from inserted) and not exists (Select * from deleted)
begin 
insert into HistoryAgent(NameAgent,PrioritetOld,PrioritetNew)
select i.НаименованиеАгента,i.Приоритет,null
from inserted i
end