Create trigger TR_Agent_AfterUpdateInsert
on [dbo].[Agents]
after Insert,Update
as
if exists (select * from inserted) and exists (Select * from deleted) and Update(���������)
begin 
insert into HistoryAgent (NameAgent,PrioritetOld,PrioritetNew)
select i.������������������,d.���������,i.���������
from inserted i inner join deleted d on i.id = d.id
end
if exists (select * from inserted) and not exists (Select * from deleted)
begin 
insert into HistoryAgent(NameAgent,PrioritetOld,PrioritetNew)
select i.������������������,i.���������,null
from inserted i
end