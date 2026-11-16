
from fastapi import APIRouter, status
from finance_io.backend.schemas import RegisterUserSchema



router = APIRouter(
    prefix="/register",
    tags=["Cadastro"]
)


@router.post(
    "",
    status_code=status.HTTP_201_CREATED,
    summary="Cadastra um novo usuário"
    )
async def register_user(data:RegisterUserSchema) -> dict[str,str]:
    return {"message":"Usuário criado com sucesso"}