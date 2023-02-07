select * from dbo.Data1;
select * from dbo.Sheet1;

select  count (*) from dbo.Data1;
select  count (*) from dbo.Sheet1;

--DATABASE for jharkhand and Bihar
select * from ProjectCensus..Data1 where state in ('jharkhand', 'Bihar');
--Total population of india
select sum (population) population from dbo.Sheet1;
-- Average growth of india
select avg (growth)*100 avg_growth from dbo.Data1;
--Average growth of states
select state, avg (growth)*100 avg_growth from dbo.Data1 group by state;
--Top 5 state showing high growth ratio
select top 5 state, avg (growth)*100 avg_growth from dbo.Data1 group by state order by avg_growth desc;
--or

--select state, avg (growth)*100 avg_growth from dbo.Data1 group by state order by avg_growth desc limit 5;

--Bottom 5 state on growth ratio
select top 5 state, avg (growth)*100 avg_growth from dbo.Data1 group by state order by avg_growth asc;

--Average sex ratio
select state, round(avg (Sex_Ratio),0) Sex_ratio from dbo.Data1 group by state;

--Average sex ratio in descending order
select state, round(avg (Sex_Ratio),0) Sex_ratio from dbo.Data1 group by state order by Sex_Ratio desc;

--Average literacy rate
select state, round(avg (Literacy),0) literacy_rate from dbo.Data1 group by state;

--Average literacy rate in descending order
--Top 5 state showing high growth ratio
select top 5 state, avg (growth)*100 avg_growth from dbo.Data1 group by state order by avg_growth desc;
--or

--select state, avg (growth)*100 avg_growth from dbo.Data1 group by state order by avg_growth desc limit 5;

--Bottom 5 state on growth ratio
select top 5 state, avg (growth)*100 avg_growth from dbo.Data1 group by state order by avg_growth asc;
--Average literacy rate above 80
select state, round(avg (Literacy),0) literacy_rate from dbo.Data1
group by state having round(avg (Literacy),0)>80 order by literacy_rate desc;

--Top and Bottom 3 state on literacy rate
drop table if exists #Topstate ---Use it so that there is not duplicate of data
create table #Topstate
( state nvarchar(255),
 topstate float
 )
 insert into #Topstate
 select state, avg (Literacy) literacy_rate from dbo.Data1 
 group by state order by literacy_rate desc;

 select Top 3 *from #Topstate order by #Topstate.topstate desc

 --Bottom state

 drop table if exists #Bottomstate 
create table #Bottomstate
( state nvarchar(255),
 bottomstate float
 )
 insert into #Bottomstate
 select state, avg (Literacy) literacy_rate from dbo.Data1 
 group by state order by literacy_rate asc;

 select Top 3 *from #Bottomstate order by #Bottomstate.bottomstate asc; 

 --Union operator

  select * from (select Top 3 *from #Topstate order by #Topstate.topstate desc)a
  union
   select * from(select Top 3 *from #Bottomstate order by #Bottomstate.bottomstate asc)b

--state satrting with letter 'A'
select distinct state from ProjectCensus..Data1 where lower(state) like 'a%'

--state satrting with letter 'A' or 'U'
select distinct state from ProjectCensus..Data1 where lower(state) like 'a%' or lower(state) like 'u%'


--state satrting with letter 'A' and ending with 'm'
select distinct state from ProjectCensus..Data1 where lower(state) like 'a%' or lower(state) like 'u%'











