FROM jellyfin/jellyfin

RUN addgroup --gid 137 --system jellyfin && \
    adduser --uid 137 --system --disabled-password --no-create-home --ingroup jellyfin jellyfin
RUN chown jellyfin:jellyfin /cache /config /media
USER jellyfin:jellyfin

ENTRYPOINT [ "dotnet", "/jellyfin/jellyfin.dll", \
    "--datadir", "/config", \
    "--cachedir", "/cache", \
    "--ffmpeg", "/usr/local/bin/ffmpeg" ]
