--Creat tabla cliente
create table cliente
(
cod_cliente serial not null,
tipo_documento  integer,
documento character(20) not null,
nombre character(20),
apellido character(20),
direccion character(40),
telefono character(20),
email character(40),
constraint "PK_cod_cliente" primary key (cod_cliente)
);


--consultar tabla cl;ientes
select * from cliente


--Crear funcion Guardar_Cliente()
/*create or replace function guardar_cliente(
pcod_cliente character, ptipo_documento character, pdocumento character, pnombre character, papellido character, pdireccion character, ptelefono character, pemail character)
returns numeric AS
$BODY$
BEGIN
INSERT INTO public.cliente(
	tipo_documento, documento, nombre, apellido, direccion, telefono, email)
	VALUES (ptipo_documento, pdocumento, pnombre, papellido, pdireccion, ptelefono, pemail);
	return currval('cliente_cod_cliente_seq')
END
$BODY$
LANGUAGE plpgsql VOLATILE
*/

CREATE OR REPLACE FUNCTION guardar_cliente(
    ptipo_documento character,
    pdocumento character,
    pnombre character,
    papellido character,
    pdireccion character,
    ptelefono character,
    pemail character)
RETURNS numeric AS
$BODY$
DECLARE
    -- Variable para almacenar el ID del nuevo cliente
    nuevo_id_cliente numeric;
BEGIN
    INSERT INTO public.cliente(
        tipo_documento, documento, nombre, apellido, direccion, telefono, email)
    VALUES 
        (ptipo_documento, pdocumento, pnombre, papellido, pdireccion, ptelefono, pemail)
    -- Usamos RETURNING para obtener el valor de cod_cliente y lo guardamos en la variable
    RETURNING cod_cliente INTO nuevo_id_cliente;

    -- Devolvemos el ID capturado
    RETURN nuevo_id_cliente;
END
$BODY$
LANGUAGE plpgsql VOLATILE;

