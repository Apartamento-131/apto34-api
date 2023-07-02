import jwt from 'jsonwebtoken'

const verifyToken = (req: any, res: any, next: any) => {
    const token = (req.headers.authorization && req.headers.authorization.split(' ')[0] === 'Bearer') ?
        req.headers.authorization.split(' ')[1] : (req.query && req.query.token) ? req.query.token : undefined
    if (!token) {
        return res.status(403).send("A token is required for authentication");
    }
    try {
        const decoded = jwt.verify(token, process.env.TOKEN_KEY || '');
        req.user = decoded;
    } catch (err) {
        return res.status(401).send("Invalid Token");
    }
    return next();
};

export default verifyToken
