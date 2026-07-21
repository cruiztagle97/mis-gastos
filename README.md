# Mis Gastos

App web simple de registro de gastos personales, en español (Chile) y pesos chilenos.
Un solo `index.html` sin build ni frameworks, con Chart.js y Supabase desde CDN.

**App:** https://TU-USUARIO.github.io/mis-gastos/

## Características

- Formulario: monto, categoría, detalle opcional, fecha y checkbox "Compartido con Simon".
- Lista estilo boleta con eliminación por fila.
- Filtros "Este mes" / "Todo", total del período y subtotal compartido con Simon
  (el monto registrado es siempre el monto completo pagado; el checkbox solo etiqueta).
- Gráfico de torta por categoría (leyenda con % ordenada) y de barras por día/mes.
- Sincronización entre dispositivos vía Supabase, con clave personal.
- localStorage como caché/respaldo sin conexión; exportar/importar JSON.
- Instalable como app (Agregar a pantalla de inicio).

## Configurar sincronización (Supabase, gratis)

1. Crear cuenta y proyecto en https://supabase.com (plan Free).
2. En **SQL Editor**, ejecutar el contenido de `supabase-setup.sql`.
3. En **Authentication → Users → Add user → Create new user**, crear un usuario con
   tu email y la clave personal que quieras usar en la app (marcar *Auto Confirm User*).
4. En **Project Settings → API**, copiar la *Project URL* y la clave *anon public*.
5. Pegar los tres valores en la sección `CONFIGURACIÓN DE SUPABASE` de `index.html`
   (`SUPABASE_URL`, `SUPABASE_ANON_KEY`, `SUPABASE_EMAIL`).

La clave *anon public* es pública por diseño; los datos quedan protegidos por
Row Level Security: solo un usuario autenticado con tu clave puede leer o escribir.
