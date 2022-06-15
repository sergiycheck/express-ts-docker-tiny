SOLVED
{
problem: {
not appending logs to access.log when starting
app with docker compose and command

    ```bash
    command: sh -c 'npm run start:prod'
    ```

}

solution {
helpful info
https://docs.docker.com/engine/reference/builder/#notes-about-specifying-volumes

stackOverflow question to answer
https://stackoverflow.com/questions/56499271/docker-compose-volume-not-synced

specify volume in DockerFile
remove old volumes, rebuild with

```bash
docker-compose up --build
```

}

}
