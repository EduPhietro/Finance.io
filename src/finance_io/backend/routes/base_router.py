
from fastapi import APIRouter
from .register_routes import router as register_router




app_router = APIRouter(
    prefix="/api/v1"
)


app_router.include_router(
    register_router
)