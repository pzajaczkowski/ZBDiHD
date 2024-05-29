FROM genevera/docker-pigz AS extract

COPY ./*.tsv.gz ./data/
RUN unpigz /data/*.tsv.gz

FROM mongo AS database

COPY --from=extract /data/*.tsv /docker-entrypoint-initdb.d/

COPY mongo.sh /docker-entrypoint-initdb.d/mongo.sh

RUN chmod +x /docker-entrypoint-initdb.d/mongo.sh

CMD ["bash", "-c", "/docker-entrypoint-initdb.d/mongo.sh"]