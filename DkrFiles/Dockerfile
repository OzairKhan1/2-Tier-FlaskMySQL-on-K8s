# ========================
# Stage 1: Build dependencies
# ========================
FROM python:3.9-slim AS builder

WORKDIR /app

# Install build tools only in this stage
RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy requirement files
COPY requirements.txt .

# Install dependencies into a wheelhouse (prebuilt wheels)
RUN pip install --upgrade pip \
    && pip wheel --no-cache-dir --no-deps -r requirements.txt -w /wheels


# ========================
# Stage 2: Runtime (final image)
# ========================
FROM python:3.9-slim

WORKDIR /app

# Install only runtime libraries (no compilers)
RUN apt-get update \
    && apt-get install -y --no-install-recommends default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy wheels from builder and install
COPY --from=builder /wheels /wheels
RUN pip install --no-cache-dir /wheels/*

# Copy app code
COPY . .

# Default command
CMD ["python", "app.py"]

