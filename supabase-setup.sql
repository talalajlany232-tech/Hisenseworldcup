create table wc_kv (
  k text primary key,
  v jsonb not null,
  updated_at timestamptz default now()
);

alter table wc_kv enable row level security;

create policy "public read" on wc_kv
  for select using (true);

create policy "public write" on wc_kv
  for insert with check (true);

create policy "public update" on wc_kv
  for update using (true);
