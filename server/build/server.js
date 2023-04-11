"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const client_1 = require("@prisma/client");
const app = (0, express_1.default)();
app.use(express_1.default.json());
app.use((0, cors_1.default)());
const prisma = new client_1.PrismaClient({
    log: ['query']
});
// Usuarios ROUTES
app.get('/usuarios', async (request, response) => {
    const usuarios = await prisma.usuario.findMany({ select: {
            id: true,
            username: true,
            senha: true,
            url_avatar: true,
            status: true
        } });
    return response.json(usuarios);
});
app.get('/usuario/:id', async (request, response) => {
    const id = request.params.id;
    const user_id = parseInt(id);
    const usuario = await prisma.usuario.findUnique({
        select: {
            id: true,
            username: true,
            senha: true,
            url_avatar: true,
            status: true
        },
        where: {
            id: user_id,
        }
    });
    return response.json(usuario);
});
// Cliente ROUTES
app.get('/clientes', async (request, response) => {
    const clientes = await prisma.cliente.findMany({
        select: {
            id: true,
            user_id: true,
            nome: true,
            telefone: true,
            status: true
        }
    });
    return response.json(clientes);
});
app.get('/cliente/:id', async (request, response) => {
    const id = request.params.id;
    const client_id = parseInt(id);
    const cliente = await prisma.cliente.findUnique({
        select: {
            id: true,
            user_id: true,
            nome: true,
            telefone: true,
            status: true
        },
        where: {
            id: client_id
        }
    });
    return response.json(cliente);
});
// Barbearia ROUTES
app.get('/barbearias', async (request, response) => {
    const barbearias = await prisma.barbearia.findMany({
        select: {
            id: true,
            nome: true,
            user_id: true,
            whatsapp: true,
            local: true,
            horarios: true
        }
    });
    return response.json(barbearias);
});
// Atividade ROUTES
app.listen(3333);
