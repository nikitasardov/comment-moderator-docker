FROM ubuntu:16.04

RUN  export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -y && apt-get upgrade -y \
    && apt-get install -y \
        nginx-light \
        python3 \
        python3-pip \
        python3-psycopg2 \
        git \
    && pip3 install --upgrade pip \
    && BUILD_DEPS='build-essential python3-dev' \
    && apt-get install -y ${BUILD_DEPS} \
    && apt-get autoremove -y ${BUILD_DEPS} \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/nikitasardov/comment-moderator-react-ui.git /var/www/app/comment-moderator-react-ui/ \
    && git clone https://github.com/nikitasardov/comment-moderator-py-backend.git /var/www/app/comment-moderator-py-backend/ \
    && pip3 install --no-cache-dir -r /var/www/app/comment-moderator-py-backend/requirements.txt

COPY config/front.conf /etc/nginx/conf.d

WORKDIR /var/www/app/comment-moderator-py-backend/app_data

CMD service nginx start && python3 /var/www/app/comment-moderator-py-backend/app.py
