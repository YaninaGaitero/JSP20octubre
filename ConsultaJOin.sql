select pq.id, p.descripcion, sum(dc.cantidad) 
from compra as c
inner join detalleCompra dc on c.id=id_Compra
inner join productos p on id_Producto=p.id
inner join piqueo pq on c.id=pq.compraID
group by c.id
order by c.id, descripcion, dc.cantidad ;


select sum(cantidad), descripcion
from detalleCompra 
join productos on id_producto=id
where id_compra in (1,2,3)
group by id


