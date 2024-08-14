# Создание нового конфигурационного файла для Mirrormaker
echo "client.id=mirror_maker_consumer_1" > mirrormaker.properties
echo "messaging.client.buffer.size=102400" >> mirrormaker.properties
echo "consumer.config=consumer.properties" >> mirrormaker.properties
echo "producer.config=producer.properties" >> mirrormaker.properties

# Создание consumer.properties
echo "bootstrap.servers=192.168.0.24:9092,192.168.0.25:9092,192.168.0.26:9092" > consumer.properties
echo "group.id=mirrormaker_group" >> consumer.properties
echo "exclude.topics=internal_topics" >> consumer.properties

# Создание producer.properties
echo "bootstrap.servers=192.168.0.24:9092" > producer.properties

# Запуск Mirrormaker
bin/kafka-run-class.sh kafka.tools.MirrorMaker --consumer.config mirrormaker.properties --producer.config mirrormaker.properties --num.streams 1
