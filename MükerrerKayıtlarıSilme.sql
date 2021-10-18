Select Title as KLN, Count(Title) as ADET , MAX(ID) as ID
From dbo.GlobalCompany 
Group By Title 
Having Count (Title) > 1



Delete from dbo.GlobalCompany where ID in (

Select MAX(ID) as ID
From dbo.GlobalCompany 
Group By Title 
Having Count (Title) > 1

)

