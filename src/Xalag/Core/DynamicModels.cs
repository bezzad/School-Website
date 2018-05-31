using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dapper;
using Xalag.Models;

namespace Xalag.Core
{
    public static class DynamicModels
    {
        public static IEnumerable<SessionModel> GetSessionsMenus()
        {
            // fetch menu by caching data
            //var result = Connections.Xalag.SqlConn.Query<SessionModel>("Select * From Places Where SessionDateTime > @Now", new { Now = DateTime.Now });

            return new List<SessionModel>();
        }

    }
}