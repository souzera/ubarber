import express, {response, request} from 'express'
import cors from 'cors'

import { PrismaClient } from '@prisma/client'

interface Id {
    id: number
}


const app = express()

app.use(express.json())
app.use(cors())


const prisma = new PrismaClient({
    log: ['query']
})

// Usuarios ROUTES

app.get('/usuarios', async (request, response) => {
    const usuarios = await prisma.usuario.findMany(
        {select:{
            id: true,
            username: true,
            senha: true,
            url_avatar: true,
            status: true
        }}
    )
    return response.json(usuarios)
})

app.get('/usuario/:id', async (request, response) => {
    
    const id = request.params.id
    const user_id = parseInt(id)

    const usuario = await prisma.usuario.findUnique(
        {
            select:{
                id: true,
                username: true,
                senha: true,
                url_avatar: true,
                status: true
            }
            ,
            where:{
                id:user_id,
            }
        }
    )

    return response.json(usuario)
})

// Cliente ROUTES

app.get('/clientes',async (request, response) => {
    const clientes = await prisma.cliente.findMany(
        {
            select:{
                id:true,
                user_id:true,
                nome: true,
                telefone: true,
                status:true
            }
        }
    )

    return response.json(clientes)
})

app.get('/cliente/:id',async (request, response) => {
    const id = request.params.id
    const client_id = parseInt(id)

    const cliente = await prisma.cliente.findUnique(
        {
            select:{
                id:true,
                user_id:true,
                nome: true,
                telefone: true,
                status:true
            },
            where:{
                id: client_id
            }
        }
    )

    return response.json(cliente)
})

// Barbearia ROUTES

app.get('/barbearias', async (request, response) =>{
    const barbearias = await prisma.barbearia.findMany({
        select:{
            id: true,
            nome: true,
            user_id: true,
            whatsapp:true,
            local:true,
            horarios:true
        }
    })

    return response.json(barbearias)
})

// Atividade ROUTES

app.get('/atividades', async (request, response) =>{
    const atividades = await prisma.atividade.findMany(
        {
            select:{
                barbearia: true,
                cliente: true,
                data_atv: true
            }
        }
    )

    return response.json(atividades)
})

app.get('/historico-cliente/:id',async (request, response) => {
    const client_id = parseInt(request.params.id)
    const history = await prisma.atividade.findMany({
        select:{
            barbearia: true,
            data_atv:true
        },
        where:{
            cliente_id: client_id
        }
    })

    return response.json(history)
})

app.get('/historico-barbearia/:id', async (request, response) => {
    const barbearia_id = parseInt(request.params.id)
    const history = await prisma.atividade.findMany({
        select:{
            cliente: true,
            data_atv: true
        },
        where:{
            barbearia_id: barbearia_id
        }
    })

    return response.json(history)
})

app.listen(3333)