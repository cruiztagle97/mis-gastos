-- Configuración de la base de datos para "Mis Gastos"
-- Pegar y ejecutar en: Supabase → SQL Editor → New query → Run

create table if not exists public.gastos (
  id uuid primary key default gen_random_uuid(),
  fecha date not null,
  categoria text not null,
  detalle text,
  monto integer not null check (monto > 0),
  compartido boolean not null default false,
  created_at timestamptz not null default now()
);

-- Seguridad: solo usuarios autenticados (tú, con tu clave) pueden ver/editar.
alter table public.gastos enable row level security;

drop policy if exists "acceso total autenticado" on public.gastos;
create policy "acceso total autenticado"
  on public.gastos
  for all
  to authenticated
  using (true)
  with check (true);
