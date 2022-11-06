

alter table rrhh.empleados add column comision;

create or replace function comision()
 RETURNS VOID as 
$BODY$
declare
	cur_report1 cursor for select idempleado from rrhh.empleados emp;
  
	rec record; 
begin
   FOR rec IN cur_report1 loop
	   
	   update rrhh.empleados 
	   set  comision=0.17*300000
	   where  rrhh.empleados.idempleado = rrhh.empleados.idempleado;
	  
   END LOOP ;
   RETURN;
end;
$BODY$
language plpgsql;

select * from comision();

create or replace function premio1()
	RETURNS VOID as 
$BODY$
declare
    cur_report2 cursor for select comision, nomempleado  from rrhh.empleados emp;
   
	rec1   record; 
begin
	FOR rec1 IN cur_report2 loop
		if rec1.comision < 1000 then
			RAISE NOTICE 'El empleado % tiene de premio refrigeradora', rec1.nomempleado;
		elsif rec1.comision < 2000 then
			RAISE NOTICE 'El empleado % tiene de premio lavadora', rec1.nomempleado;
		elsif rec1.comision > 2000 then
			RAISE NOTICE 'El empleado % tiene de premio equipo de sonido', rec1.nomempleado;
		
		end if;
	END loop;
	return;
end;
$BODY$
language plpgsql;
select * from premio1();

----ejer2

create or replace function reporte2()
	RETURNS VOID as 
$BODY$
declare
    cur_report2 cursor for select nomcliente, dircliente, idpais  from ventas.clientes cli, ventas.paises p,
   ventas.pedidoscabe pc, ventas.pedidosdeta pd;
   
	rec2   record; 
begin
	FOR rec1 IN cur_report2 loop
		if rec1.comision < 1000 then
			RAISE NOTICE 'El empleado % tiene de premio refrigeradora', rec1.nomempleado;
		elsif rec1.comision < 2000 then
			RAISE NOTICE 'El empleado % tiene de premio lavadora', rec1.nomempleado;
		elsif rec1.comision > 2000 then
			RAISE NOTICE 'El empleado % tiene de premio equipo de sonido', rec1.nomempleado;
		
		end if;
	END loop;
	return;
end;
$BODY$
language plpgsql;
select * from reporte2();





