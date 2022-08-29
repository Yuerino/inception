all:
		@sudo mkdir -p /home/cthien-h/data/mariadb
		@sudo mkdir -p /home/cthien-h/data/wordpress
		-docker volume rm $$(docker volume ls -q)
		cd srcs; docker-compose -f docker-compose.yml up --build --remove-orphans

down:
		cd srcs; docker-compose -f docker-compose.yml down

clean:
		-docker stop $$(docker ps -qa)
		-docker rm $$(docker ps -qa)
		-docker volume rm $$(docker volume ls -q)

fclean: clean
		-docker rmi -f $$(docker images -qa)
		@sudo rm -rf /home/cthien-h/data

setup-domain:
		@sudo bash -c 'echo "127.0.0.1	cthien-h.42.fr" >> /etc/hosts'

.PHONY: all down clean fclean setup-domain
