from kafka import KafkaAdminClient
from kafka.admin import ConfigResource, ConfigResourceType

# Создаем экземпляр AdminClient
admin_client = KafkaAdminClient(bootstrap_servers='localhost:9092')

# Функция для изменения настроек топика
def update_topic_config(Test, config_updates):
    # Создаем объект ConfigResource для топика
    topic_resource = ConfigResource(ConfigResourceType.TOPIC, Test)
    
    # Обновляем конфигурацию топика
    admin_client.alter_configs([topic_resource], [config_updates])

# Пример изменения параметров ретенции
update_topic_config("Test", {
    "retention.ms": "604800000",  # 7 дней в миллисекундах
    "retention.bytes": "-1"        # Без ограничения
})

admin_client.close()
