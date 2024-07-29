FROM scratch
COPY . /teldrive
EXPOSE 8080
ENTRYPOINT ["/teldrive","run","--tg-session-file","/session.db"]
