with recursive buf as 
(select
node1 as tour,
node1, 
node2,
cost, cost as summ
from
class_tsp_data
where node1='a'

union all

select
parent.tour || ', ' || child.node1 as trace, 
child.node1,
child.node2,
child.cost,
parent.summ + child.cost as summ
from class_tsp_data as child
inner join buf as parent on child.node1=parent.node2
where tour not like '%' || child.node1 || '%')

select summ as total_cost,
concat('{', tour, ', ', node2, '}') as tour
from (select *
from buf 
where length (tour) = 10 
and node2= 'a') as a
order by total_cost, tour;
