Установка kafka+zoo с помощью ansible-playbook - main.yml. В него входит установка кластера с zoо и создание топиков.
```
./kafka/main.yml
```

Для будущих изменений через kafka-gitops изменять: 
- topic.yml для создания и настройки топиков
- ACL.yml для доступа пользователей
