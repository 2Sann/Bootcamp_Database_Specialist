# BACKUP E RECOVERY

Backup com mysqldump:

```bash
mysqldump -u seu_usuario -p sua_senha nome_do_banco_de_dados > backup.sql
```

Recuperação do backup:
```bash
mysql -u seu_usuario -p sua_senha nome_do_banco_de_dados < backup.sql
```